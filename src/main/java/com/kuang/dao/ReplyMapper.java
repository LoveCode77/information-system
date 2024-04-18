package com.kuang.dao;

import com.kuang.pojo.Reply;

import java.util.List;

public interface ReplyMapper {
    //通过帖子id查询
    List<Reply> queryByTopicId(int topicId);
    List<Reply> queryByReplyContexts(String replyContexts);

    int addReply(Reply reply);
    int deleteReply(int replyId);
    int updataReply(Reply reply);
}
