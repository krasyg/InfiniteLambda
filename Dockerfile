FROM bash
COPY ping.sh .

CMD ["bash", "ping.sh"]