#!/bin/bash
curl http://localhost:8888/v1/chain/get_info | python -m json.tool
