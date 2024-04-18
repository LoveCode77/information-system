package com.kuang.dao;

import com.kuang.pojo.Topic;

import java.util.List;

public interface TopicMapper {
//    查询
    List<Topic> queryAllTopics();
    List<Topic> queryAllTopicsOrderByReply();
    Topic queryTopicByTopicId(int topicId);
    List<Topic> queryByTopicTitleOrTopicContexts(String input);
    List<Topic> queryByTopicSectonId(int topicSectonId);
    int addTopic(Topic topic);
    int deleteTopic(int topicId);
    int updataTopic(Topic topic);
}
