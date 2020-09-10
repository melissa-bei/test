#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# Copyright (c) 2020 libei. All right reserved.
"""=================================================
@IDE    ：PyCharm
@Author ：Li Bei
@Email  : libei@cadg.cn
@Date   ：2020/7/27 17:20
================================================="""
import base64
from tencentcloud.common import credential
from tencentcloud.common.profile.client_profile import ClientProfile
from tencentcloud.common.profile.http_profile import HttpProfile
from tencentcloud.common.exception.tencent_cloud_sdk_exception import TencentCloudSDKException
from tencentcloud.ocr.v20181119 import ocr_client, models


def ImageEncoder(pic_path):
    """图片base64加密"""
    with open(pic_path, "rb") as f:
        str_data = base64.b64encode(f.read()).decode()
    return str_data


def tencent_ocr(pic_path):
    try:
        cred = credential.Credential("AKIDiBoAJMB4cttgCSuIzPec8NL3ZwZxcRXR", "whaCXewykHemdDXoyra5RZQ01mGUBpDK")
        httpProfile = HttpProfile()
        httpProfile.endpoint = "ocr.tencentcloudapi.com"

        clientProfile = ClientProfile()
        clientProfile.httpProfile = httpProfile
        clientProfile.signMethod = "TC3-HMAC-SHA256"
        client = ocr_client.OcrClient(cred, "ap-beijing", clientProfile)

        req = models.GeneralBasicOCRRequest()
        params = '{"ImageBase64":"ImageEncoder"}'.replace("ImageEncoder", ImageEncoder(pic_path))
        req.from_json_string(params)

        resp = client.GeneralBasicOCR(req)
        print(resp.to_json_string())

    except TencentCloudSDKException as err:
        print(err)


if __name__ == "__main__":
    print("正在进行OCR解析，请稍等。。。")
    path = "C:\\Users\\lib\\Desktop\\1.jpg"
    tencent_ocr(path)