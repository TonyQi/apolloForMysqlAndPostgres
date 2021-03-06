package com.ctrip.framework.apollo.biz.entity;

import com.ctrip.framework.apollo.common.entity.BaseEntity;

import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "grayreleaserule")
@SQLDelete(sql = "Update grayreleaserule set isdeleted = 1 where id = ?")
@Where(clause = "isdeleted = 0")
public class GrayReleaseRule extends BaseEntity{

  @Column(name = "appid", nullable = false)
  private String appId;

  @Column(name = "clustername", nullable = false)
  private String clusterName;

  @Column(name = "namespacename", nullable = false)
  private String namespaceName;

  @Column(name = "branchname", nullable = false)
  private String branchName;

  @Column(name = "rules")
  private String rules;

  @Column(name = "releaseid", nullable = false)
  private Long releaseId;

  @Column(name = "branchstatus", nullable = false)
  private int branchStatus;

  public String getAppId() {
    return appId;
  }

  public void setAppId(String appId) {
    this.appId = appId;
  }

  public String getClusterName() {
    return clusterName;
  }

  public void setClusterName(String clusterName) {
    this.clusterName = clusterName;
  }

  public String getNamespaceName() {
    return namespaceName;
  }

  public void setNamespaceName(String namespaceName) {
    this.namespaceName = namespaceName;
  }

  public String getBranchName() {
    return branchName;
  }

  public void setBranchName(String branchName) {
    this.branchName = branchName;
  }

  public String getRules() {
    return rules;
  }

  public void setRules(String rules) {
    this.rules = rules;
  }

  public Long getReleaseId() {
    return releaseId;
  }

  public void setReleaseId(Long releaseId) {
    this.releaseId = releaseId;
  }

  public int getBranchStatus() {
    return branchStatus;
  }

  public void setBranchStatus(int branchStatus) {
    this.branchStatus = branchStatus;
  }
}
