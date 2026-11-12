import http.server, ssl, os
os.chdir('/tmp/claude-0/ws/www')
s=http.server.HTTPServer(('93.184.215.14',443),http.server.SimpleHTTPRequestHandler)
c=ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER); c.load_cert_chain('/tmp/claude-0/ws/cert.pem','/tmp/claude-0/ws/key.pem')
s.socket=c.wrap_socket(s.socket,server_side=True); s.serve_forever()
