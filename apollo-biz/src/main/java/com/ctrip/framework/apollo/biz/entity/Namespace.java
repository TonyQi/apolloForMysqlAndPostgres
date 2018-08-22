package com.ctrip.framework.apollo.biz.entity;

import com.ctrip.framework.apollo.common.entity.BaseEntity;

import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "namespace")
@SQLDelete(sql = "Update namespace set isdeleted = 1 where id = ?")
@Where(clause = "isdeleted = 0")
public class Namespace extends BaseEntity {

  @Column(name = "appid", nullable = false)
  private String appId;

  @Column(name = "clustername", nullable = false)
  private String clusterName;

  @Column(name = "namespacename", nullable = false)
  private String namespaceName;

  public Namespace(){

  }

  public Namespace(String appId, String clusterName, String namespaceName) {
    this.appId = appId;
    this.clusterName = clusterName;
    this.namespaceName = namespaceName;
  }

  public String getAppId() {
    return appId;
  }

  public String getClusterName() {
    return clusterName;
  }

  public String getNamespaceName() {
    return namespaceName;
  }

  public void setAppId(String appId) {
    this.appId = appId;
  }

  public void setClusterName(String clusterName) {
    this.clusterName = clusterName;
  }

  public void setNamespaceName(String namespaceName) {
    this.namespaceName = namespaceName;
  }

  public String toString() {
    return toStringHelper().add("appId", appId).add("clusterName", clusterName)
        .add("namespaceName", namespaceName).toString();
  }
}