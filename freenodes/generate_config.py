#!/bin/python3

import os
import sys
import yaml
import requests

def read_yaml(file_path):
    with open(file_path, 'r') as f:
        data = yaml.safe_load(f)
    return data['urls']

def load_content_from_url(url):
    response = requests.get(url)
    response.raise_for_status()
    res = yaml.safe_load(response.text)
    return res['proxies']

def load_all_proxies(urls):
    all_proxies = []
    for url in urls:
        proxies = load_content_from_url(url)
        all_proxies.extend(proxies)
    return all_proxies

def generate_proxies_config(proxies):
    config = {
        'proxies': proxies,
        'proxy-groups': [
            {
                'name': 'Auto',
                'type': 'url-test',
                'proxies': [proxy['name'] for proxy in proxies],
                'url': 'http://www.gstatic.com/generate_204',
                'interval': 300
            }
        ]
    }
    return config

def generate_final_config(proxies_config):
    with open('./default_config.yaml', 'r', encoding='utf-8') as f:
        default_config = yaml.safe_load(f)
    final_config = {**default_config, **proxies_config}
    return final_config

def generate_config_file(config):
    with open('./config.yaml', 'w', encoding='utf-8') as f:
        yaml.safe_dump(config, f, default_flow_style=False, allow_unicode=True)

def main():
    urls = read_yaml('nodelist.yaml')
    proxies = load_all_proxies(urls)
    proxies_config = generate_proxies_config(proxies)
    final_config = generate_final_config(proxies_config)
    generate_config_file(final_config)

if __name__ == '__main__':
    main()