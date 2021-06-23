#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# Copyright (c) 2020 libei. All right reserved.
"""=================================================
@IDE    ：PyCharm
@Author ：Li Bei
@Email  : libei@cadg.cn
@Date   ：2021/5/20 15:33
================================================="""
from gensim.models.word2vec import Word2Vec
import nlp.pre_process as pp
from nlp.model import Embedding_BiLSTM_CRF

# 标签转编号
tag2id = {'o': 0, 'B_ns': 1, 'B_nr': 2, 'B_nt': 3, 'M_nt': 4, 'M_nr': 5, 'M_ns': 6, 'E_nt': 7, 'E_nr': 8, 'E_ns': 9}

# lstm 的长度，这个量要对所有句子长短统计，取大多数句子的长度
seq_len = 20

# 生成所有数据源
def generate_all_files():
    pp.build_train_test('origion_data/train1.txt', 'origion_data/testright1.txt', 'origion_data/train.txt',
                        'origion_data/test.txt')

    pp.build_wordtag('origion_data/train.txt', 'mid_data/train/train_word_tag.txt')
    pp.build_wordtag('origion_data/test.txt', 'mid_data/test/test_word_tag.txt')

    pp.build_sentences_labels('mid_data/train/train_word_tag.txt', 'mid_data/train/train_sentences.txt',
                              'mid_data/train/train_labels.txt', tag2id)
    pp.build_sentences_labels('mid_data/test/test_word_tag.txt', 'mid_data/test/test_sentences.txt',
                              'mid_data/test/test_labels.txt', tag2id)

    pp.build_word_char_number('mid_data/train/train_sentences.txt', 'mid_data/train/train_word_number.txt',
                              'mid_data/train/train_char_number.txt')

    pp.filter_test_sentences_labels('mid_data/train/train_char_number.txt', 'mid_data/test/test_sentences.txt',
                                    'mid_data/test/test_labels.txt', 'mid_data/test/test_filter_sentences.txt',
                                    'mid_data/test/test_filter_labels.txt')

    pp.build_word_char_number('mid_data/train/train_sentences.txt', 'mid_data/train/train_word_number.txt',
                              'mid_data/train/train_char_number.txt')
    pp.build_word_char_number('mid_data/test/test_filter_sentences.txt', 'mid_data/test/test_word_number.txt',
                              'mid_data/test/test_char_number.txt')

generate_all_files()
word2vec_model = Word2Vec.load('train_model/word2vec.model')
num_chars, word_embeddings, char_number_dict, word_number_dict = pp.get_paras('mid_data/train/train_char_number.txt',
                                                                              'mid_data/train/train_word_number.txt',
                                                                              'mid_data/test/test_word_number.txt',
                                                                              word2vec_model)

train_sentences_chars_vec, train_sentences_words_vec, train_sentences_labels = pp.get_model_seq(char_number_dict,
                                                                                                word_number_dict,
                                                                                                'mid_data/train/train_sentences.txt',
                                                                                                'mid_data/train/train_labels.txt',
                                                                                                seq_len)

test_sentences_chars_vec, test_sentences_words_vec, test_sentences_labels = pp.get_model_seq(char_number_dict,
                                                                                             word_number_dict,
                                                                                             'mid_data/test/test_filter_sentences.txt',
                                                                                             'mid_data/test/test_filter_labels.txt',
                                                                                             seq_len)

hidden_dim = 30
use_peepholes = True
keep_prob = [0.6]
epochs = 150
batch_size = 50
gradient_threshold = 5
char_vec_dim_line = num_chars + 1  # +1 是因为如果句子长度不够 20 要补植，需要一个向量来表示补的字
char_vec_dim_col = 30
num_tags = len(tag2id)
word_embeddings.insert(0, [0 for _ in range(30)])  # 同上，需要一个向量来表示补的词

model_path = 'train_model/bilstm_crf_model.ckpt'
lr = 0.01

model = Embedding_BiLSTM_CRF(char_vec_dim_line, char_vec_dim_col, num_tags, hidden_dim, use_peepholes,
                             word_embeddings=word_embeddings)
model.build_graph()
model.train(train_sentences_chars_vec, train_sentences_words_vec, train_sentences_labels, test_sentences_chars_vec,
            test_sentences_words_vec, test_sentences_labels, epochs, batch_size, gradient_threshold, keep_prob,
            lr, model_path)

scores = model.test(model_path, test_sentences_chars_vec, test_sentences_words_vec, test_sentences_labels)
print(scores)

pred_labels = model.predict(model_path, test_sentences_chars_vec[:10], test_sentences_words_vec[:10])

for i in range(10):
    print('sentence seq ' + str(i + 1) + ':')
    print('pred labels:', pred_labels[i])
    print('real labels:', test_sentences_labels[i])
