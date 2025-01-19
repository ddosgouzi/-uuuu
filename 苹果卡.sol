import requests
import hashlib
import json

# 配置您的API密钥和商户ID
api_key = '您的API密钥'
merchant_id = '您的商户ID'
notify_url = '您的支付结果通知URL'

def generate_signature(params, api_key):
    """
    生成签名
    """
    sorted_params = sorted(params.items())
    query_string = '&'.join(f"{k}={v}" for k, v in sorted_params)
    query_string += f"&key={api_key}"
    signature = hashlib.md5(query_string.encode('utf-8')).hexdigest().upper()
    return signature

def create_payment_request(amount, order_id, description):
    """
    创建支付请求
    """
    url = "https://pay.163.com/api/pay"  # 假设的支付接口URL
    params = {
        'merchant_id': merchant_id,
        'amount': amount,
        'order_id': order_id,
        'description': description,
        'notify_url': notify_url,
        'timestamp': '20250119170800'  # 当前时间戳
    }
    signature = generate_signature(params, api_key)
    params['signature'] = signature

    response = requests.post(url, data=params)
    return response.json()

# 示例使用
amount = 100  # 支付金额，单位为分
order_id = '订单ID123456'
description = '商品描述'

payment_response = create_payment_request(amount, order_id, description)
print(json.dumps(payment_response, indent=4, ensure_ascii=False))

The platform risk control has been lifted, and the merchant will ship your order within 24 hours
