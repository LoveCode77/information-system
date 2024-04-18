package com.kuang.service;

import com.kuang.dao.ReplyMapper;
import com.kuang.pojo.Reply;

import java.util.List;

public class ReplyServiceImpl implements ReplyService{

    private ReplyMapper replyMapper;

    public void setReplyMapper(ReplyMapper replyMapper) {
        this.replyMapper = replyMapper;
    }

    @Override
    public List<Reply> queryByTopicId(int topicId) {
        return replyMapper.queryByTopicId(topicId);
    }

    @Override
    public List<Reply> queryByReplyContexts(String replyContexts) {
        return replyMapper.queryByReplyContexts(replyContexts);
    }


    @Override
    public int addReply(Reply reply) {
        return replyMapper.addReply(reply);
    }

    @Override
    public int deleteReply(int replyId) {
        return 0;
    }

    @Override
    public int updataReply(Reply reply) {
        return 0;
    }
}
