#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# Copyright (c) 2020 libei. All right reserved.
"""=================================================
@IDE    ：PyCharm
@Author ：Li Bei
@Email  : libei@cadg.cn
@Date   ：2021/5/20 15:31
================================================="""
import tensorflow as tf
from tensorflow.contrib.crf import crf_log_likelihood
import numpy as np
from tensorflow.contrib.crf import viterbi_decode
from sklearn.metrics import accuracy_score
from sklearn.metrics import recall_score
from sklearn.metrics import f1_score


class Embedding_BiLSTM_CRF(object):
    def __init__(self, char_vec_dim_line, char_vec_dim_col, num_tags, hidden_dim, use_peepholes, word_embeddings=None):
        self.char_vec_dim_line = char_vec_dim_line
        self.char_vec_dim_col = char_vec_dim_col
        self.word_embeddings = word_embeddings
        self.num_tags = num_tags
        self.hidden_dim = hidden_dim
        self.use_peepholes = use_peepholes
        self.learning_rate = tf.placeholder(tf.float32)

        self.keep_prob = tf.placeholder(tf.float32, [None])
        self.char_ids = tf.placeholder(tf.int32, shape=[None, None], name="char_ids")
        self.labels = tf.placeholder(tf.int32, shape=[None, None], name="labels")
        self.seq_len = tf.placeholder(tf.int32, shape=[None], name="sequence_lengths")
        if word_embeddings != None:
            self.word_ids = tf.placeholder(tf.int32, shape=[None, None], name="word_ids")

    def build_graph(self):
        self.Embedding_layer()
        self.BiLSTM_layer()
        self.CRF_layer()

    def Embedding_layer(self):
        with tf.variable_scope('Embedding_layer'):
            embedding_mat = np.random.uniform(-0.5, 0.5, (self.char_vec_dim_line, self.char_vec_dim_col))
            embedding_mat = np.float32(embedding_mat)
            _char_embeddings = tf.Variable(embedding_mat, dtype=tf.float32, trainable=True, name='_char_embeddings')
            char_embeddings = tf.nn.embedding_lookup(params=_char_embeddings, ids=self.char_ids, name='char_embeddings')

            if self.word_embeddings != None:
                _l_word_embeddings = tf.Variable(np.array(self.word_embeddings), dtype=tf.float32, trainable=False,
                                                 name='_l_word_embeddings')
                l_word_embeddings = tf.nn.embedding_lookup(params=_l_word_embeddings, ids=self.word_ids,
                                                           name='l_word_embeddings')
                self.char_embeddings = tf.concat([l_word_embeddings, char_embeddings], axis=-1)

            else:
                self.char_embeddings = char_embeddings

    def BiLSTM_layer(self):
        with tf.variable_scope('BiLSTM_layer', reuse=tf.AUTO_REUSE):
            initializer = tf.truncated_normal_initializer()
            lstm_forward_1 = tf.nn.rnn_cell.LSTMCell(self.hidden_dim, self.use_peepholes, initializer=initializer)
            lstm_backward_1 = tf.nn.rnn_cell.LSTMCell(self.hidden_dim, self.use_peepholes, initializer=initializer)
            (output_forward_seq_1, output_backward_seq_1), _ = tf.nn.bidirectional_dynamic_rnn(lstm_forward_1,
                                                                                               lstm_backward_1,
                                                                                               self.char_embeddings,
                                                                                               sequence_length=self.seq_len,
                                                                                               dtype=tf.float32)

            output_1 = tf.concat([output_forward_seq_1, output_backward_seq_1], axis=-1)

            lstm_forward_2 = tf.nn.rnn_cell.LSTMCell(self.hidden_dim, self.use_peepholes, initializer=initializer)
            lstm_backward_2 = tf.nn.rnn_cell.LSTMCell(self.hidden_dim, self.use_peepholes, initializer=initializer)
            (output_forward_seq_2, output_backward_seq_2), _ = tf.nn.bidirectional_dynamic_rnn(lstm_forward_2,
                                                                                               lstm_backward_2,
                                                                                               output_1,
                                                                                               sequence_length=self.seq_len,
                                                                                               dtype=tf.float32)

            output_2 = tf.concat([output_forward_seq_2, output_backward_seq_2], axis=-1)

            output = tf.nn.dropout(output_2, self.keep_prob[0])
            pred = tf.layers.dense(inputs=output, units=self.num_tags, activation=None,
                                   kernel_initializer=tf.contrib.layers.xavier_initializer())

        self.logits = tf.reshape(pred, [-1, tf.shape(output)[1], self.num_tags])

    def CRF_layer(self):
        with tf.variable_scope('CRF_layer'):
            log_likelihood, self.transition_mat = crf_log_likelihood(inputs=self.logits, tag_indices=self.labels,
                                                                     sequence_lengths=self.seq_len)

        self.log_likelihood = log_likelihood

    def get_seq_len(self, batch_seq):
        seq_len = []
        for seq in batch_seq:
            seq_len.append(len(seq))

        return seq_len

    def train(self, train_sentences_chars_vec, train_sentences_words_vec, train_sentences_labels,
              test_sentences_chars_vec, test_sentences_words_vec, test_sentences_labels, epochs, batch_size,
              gradient_threshold, keep_prob, lr, model_path):
        saver = tf.train.Saver()
        optimizer = tf.train.AdamOptimizer(learning_rate=self.learning_rate)
        loss = tf.reduce_mean(-self.log_likelihood)
        grads, variables = zip(*optimizer.compute_gradients(loss))
        grads, global_norm = tf.clip_by_global_norm(grads, gradient_threshold)
        train_op = optimizer.apply_gradients(zip(grads, variables))
        with tf.Session() as sess:
            sess.run(tf.global_variables_initializer())
            print('training start')
            for epoch in range(epochs):
                # 训练集
                learing_rate = tf.train.exponential_decay(learning_rate=lr, global_step=epoch, decay_steps=5,
                                                          decay_rate=0.9, staircase=False)
                lr_value = sess.run(learing_rate)
                train_remain = len(train_sentences_chars_vec) % batch_size
                train_batch_counts = int((len(train_sentences_chars_vec) - train_remain) / batch_size)
                epoch_train_loss_list = []
                for count in range(train_batch_counts + 1):
                    if count == train_batch_counts:
                        if train_remain != 0:
                            char_ids = train_sentences_chars_vec[-batch_size:]
                            labels = train_sentences_labels[-batch_size:]
                            seq_len = self.get_seq_len(train_sentences_chars_vec[-batch_size:])
                        else:
                            continue
                    else:
                        char_ids = train_sentences_chars_vec[count * batch_size: (count + 1) * batch_size]
                        labels = train_sentences_labels[count * batch_size: (count + 1) * batch_size]
                        seq_len = self.get_seq_len(
                            train_sentences_chars_vec[count * batch_size: (count + 1) * batch_size])
                    if self.word_embeddings != None:
                        if count == train_batch_counts:
                            if train_remain != 0:
                                word_ids = train_sentences_words_vec[-batch_size:]
                            else:
                                continue
                        else:
                            word_ids = train_sentences_words_vec[count * batch_size: (count + 1) * batch_size]
                        feed_dict = {self.char_ids: char_ids, self.word_ids: word_ids, self.labels: labels,
                                     self.seq_len: seq_len, self.keep_prob: keep_prob, self.learning_rate: lr_value}
                    else:
                        feed_dict = {self.char_ids: char_ids, self.labels: labels, self.seq_len: seq_len,
                                     self.keep_prob: keep_prob, self.learning_rate: lr_value}

                    _, train_loss = sess.run([train_op, loss], feed_dict=feed_dict)
                    epoch_train_loss_list.append(train_loss)

                epoch_train_loss = sum(epoch_train_loss_list) / len(epoch_train_loss_list)

                # 测试集
                test_remain = len(test_sentences_chars_vec) % batch_size
                test_batch_counts = int((len(test_sentences_chars_vec) - test_remain) / batch_size)
                epoch_test_loss_list = []
                for count in range(test_batch_counts + 1):
                    if count == test_batch_counts:
                        if test_remain != 0:
                            char_ids = test_sentences_chars_vec[-batch_size:]
                            labels = test_sentences_labels[-batch_size:]
                            seq_len = self.get_seq_len(test_sentences_chars_vec[-batch_size:])
                        else:
                            continue
                    else:
                        char_ids = test_sentences_chars_vec[count * batch_size: (count + 1) * batch_size]
                        labels = test_sentences_labels[count * batch_size: (count + 1) * batch_size]
                        seq_len = self.get_seq_len(
                            test_sentences_chars_vec[count * batch_size: (count + 1) * batch_size])
                    if self.word_embeddings != None:
                        if count == test_batch_counts and test_remain != 0:
                            word_ids = test_sentences_words_vec[-batch_size:]
                        else:
                            word_ids = test_sentences_words_vec[count * batch_size: (count + 1) * batch_size]
                        feed_dict = {self.char_ids: char_ids, self.word_ids: word_ids, self.labels: labels,
                                     self.seq_len: seq_len, self.keep_prob: [1.0]}
                    else:
                        feed_dict = {self.char_ids: char_ids, self.labels: labels, self.seq_len: seq_len,
                                     self.keep_prob: [1.0]}

                    test_loss = sess.run(loss, feed_dict=feed_dict)
                    epoch_test_loss_list.append(test_loss)

                epoch_test_loss = sum(epoch_test_loss_list) / len(epoch_test_loss_list)

                print('epoch:', epoch + 1, 'train loss:', epoch_train_loss, 'test loss:', epoch_test_loss,
                      'learning_rate:', lr_value)
                with open('score.txt', mode='a') as file:
                    file.write(
                        'epoch: ' + str(epoch + 1) + '  train loss: ' + str(epoch_train_loss) + '  test loss: ' + str(
                            epoch_test_loss) + '  learning_rate: ' + str(lr_value) + '\n')

            print('training end')
            saver.save(sess, model_path)

    def test(self, model_path, test_sentences_chars_vec, test_sentences_words_vec, test_sentences_labels):
        saver = tf.train.Saver()
        with tf.Session() as sess:
            saver.restore(sess, model_path)
            seq_len = self.get_seq_len(test_sentences_chars_vec)
            if self.word_embeddings != None:
                feed_dict = {self.char_ids: test_sentences_chars_vec, self.word_ids: test_sentences_words_vec,
                             self.seq_len: seq_len, self.keep_prob: [1.0]}
            else:
                feed_dict = {self.char_ids: test_sentences_chars_vec, self.seq_len: seq_len, self.keep_prob: [1.0]}

            logits, transition_mat = sess.run([self.logits, self.transition_mat], feed_dict=feed_dict)
            pred_labels = []
            for i in range(len(logits)):
                viterbi_seq, _ = viterbi_decode(logits[i][:seq_len[i]], transition_mat)
                pred_labels.append(viterbi_seq)

            accuracy_scores = []
            recall_scores = []
            f1_scores = []

            for i in range(len(test_sentences_labels)):
                test_sentence_label = test_sentences_labels[i]
                pred_label = pred_labels[i]
                accuracy_scores.append(accuracy_score(test_sentence_label, pred_label))
                recall_scores.append(recall_score(test_sentence_label, pred_label, average='macro'))
                f1_scores.append(f1_score(test_sentence_label, pred_label, average='macro'))

        return {'accuracy_score': sum(accuracy_scores) / len(accuracy_scores),
                'recall_score': sum(recall_scores) / len(recall_scores),
                'f1_score': sum(f1_scores) / len(f1_scores)}

    def predict(self, model_path, test_sentences_chars_vec, test_sentences_words_vec):
        saver = tf.train.Saver()
        with tf.Session() as sess:
            saver.restore(sess, model_path)
            seq_len = self.get_seq_len(test_sentences_chars_vec)
            if self.word_embeddings != None:
                feed_dict = {self.char_ids: test_sentences_chars_vec, self.word_ids: test_sentences_words_vec,
                             self.seq_len: seq_len, self.keep_prob: [1.0]}
            else:
                feed_dict = {self.char_ids: test_sentences_chars_vec, self.seq_len: seq_len, self.keep_prob: [1.0]}

            logits, transition_mat = sess.run([self.logits, self.transition_mat], feed_dict=feed_dict)
            pred_labels = []
            for i in range(len(logits)):
                viterbi_seq, _ = viterbi_decode(logits[i][:seq_len[i]], transition_mat)

                pred_labels.append(viterbi_seq)

        return pred_labels
