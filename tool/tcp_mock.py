import socket
import time
M_SIZE = 1024

tcp_client_address = ('127.0.0.1', 20000)
tcp_client_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
tcp_client_sock.connect(tcp_client_address)
tcp_client_sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

def send(msg):
    send_len = tcp_client_sock.send(msg.encode('utf-8'))
    print("send:{}:({})".format(msg, send_len))

def receive() -> (str):
    try:
        text = tcp_client_sock.recv(M_SIZE)

        text = text.decode(encoding='utf-8')
        print("receive:{}".format(text))
        return text

    except KeyboardInterrupt as ke:
        print(ke)
        return None

if __name__ == '__main__':
    print("waiting message...")
    while(True):
        text = input()
        send(text)
        text = receive()
        print(text)
        if(len(text) == 0):
            break