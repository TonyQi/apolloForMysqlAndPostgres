package com.ctrip.framework.apollo.biz.entity;

import com.ctrip.framework.apollo.common.entity.BaseEntity;

import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.Table;

/**
 * @author Jason Song(song_s@ctrip.com)
 */
@Entity
@Table(name = "release")
@SQLDelete(sql = "Update release set isdeleted = 1 where id = ?")
@Where(clause = "isdeleted = 0")
public class Release extends BaseEntity {
  @Column(name = "releasekey", nullable = false)
  private String releaseKey;

  @Column(name = "name", nullable = false)
  private String name;

  @Column(name = "appid", nullable = false)
  private String appId;

  @Column(name = "clustername", nullable = false)
  private String clusterName;

  @Column(name = "namespacename", nullable = false)
  private String namespaceName;

  @Column(name = "configurations", nullable = false)
  private String configurations;

  @Column(name = "comment", nullable = false)
  private String comment;

  @Column(name = "isabandoned", columnDefinition = "Bit default '0'")
  private boolean isAbandoned;

  public String getReleaseKey() {
    return releaseKey;
  }

  public String getAppId() {
    return appId;
  }

  public String getClusterName() {
    return clusterName;
  }

  public String getComment() {
    return comment;
  }

  public String getConfigurations() {
    return configurations;
  }

  public String getNamespaceName() {
    return namespaceName;
  }

  public String getName() {
    return name;
  }

  public void setReleaseKey(String releaseKey) {
    this.releaseKey = releaseKey;
  }

  public void setAppId(String appId) {
    this.appId = appId;
  }

  public void setClusterName(String clusterName) {
    this.clusterName = clusterName;
  }

  public void setComment(String comment) {
    this.comment = comment;
  }

  public void setConfigurations(String configurations) {
    this.configurations = configurations;
  }

  public void setNamespaceName(String namespaceName) {
    this.namespaceName = namespaceName;
  }

  public void setName(String name) {
    this.name = name;
  }

  public boolean isAbandoned() {
    return isAbandoned;
  }

  public void setAbandoned(boolean abandoned) {
    isAbandoned = abandoned;
  }

  public String toString() {
    return toStringHelper().add("name", name).add("appId", appId).add("clusterName", clusterName)
        .add("namespaceName", namespaceName).add("configurations", configurations)
        .add("comment", comment).add("isAbandoned", isAbandoned).toString();
  }
}
