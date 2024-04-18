package com.kuang.service;

import com.kuang.pojo.Reply;

import java.util.List;

public interface ReplyService {
    //通过帖子id查询
    List<Reply> queryByTopicId(int topicId);
    List<Reply> queryByReplyContexts(String replyContexts);

    int addReply(Reply reply);
    int deleteReply(int replyId);
    int updataReply(Reply reply);
}
