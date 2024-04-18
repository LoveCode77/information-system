package com.kuang.service;

import com.kuang.dao.TopicMapper;
import com.kuang.pojo.Topic;

import java.util.List;

public class TopicServiceImpl implements TopicService{
    private TopicMapper topicMapper;

    public void setTopicMapper(TopicMapper topicMapper) {
        this.topicMapper = topicMapper;
    }

    @Override
    public List<Topic> queryAllTopics() {
        return topicMapper.queryAllTopics();
    }

    @Override
    public List<Topic> queryAllTopicsOrderByReply() {
        return topicMapper.queryAllTopicsOrderByReply();
    }

    @Override
    public Topic queryTopicByTopicId(int topicId) {
        return topicMapper.queryTopicByTopicId(topicId);
    }

    @Override
    public List<Topic> queryByTopicTitleOrTopicContexts(String input) {
        return topicMapper.queryByTopicTitleOrTopicContexts(input);
    }

    @Override
    public List<Topic> queryByTopicSectonId(int topicSectonId) {
        return topicMapper.queryByTopicSectonId(topicSectonId);
    }

    @Override
    public int addTopic(Topic topic) {
        return topicMapper.addTopic(topic);
    }

    @Override
    public int deleteTopic(int topicId) {
        return topicMapper.deleteTopic(topicId);
    }

    @Override
    public int updataTopic(Topic topic) {
        return topicMapper.updataTopic(topic);
    }
}
