package com.ctrip.framework.apollo.biz.entity;

import com.ctrip.framework.apollo.common.entity.BaseEntity;

import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "privilege")
@SQLDelete(sql = "Update privilege set isdeleted = 1 where id = ?")
@Where(clause = "isdeleted = 0")
public class Privilege extends BaseEntity {

  @Column(name = "name", nullable = false)
  private String name;

  @Column(name = "priviltype", nullable = false)
  private String privilType;

  @Column(name = "namespaceid")
  private long namespaceId;

  public String getName() {
    return name;
  }

  public long getNamespaceId() {
    return namespaceId;
  }

  public String getPrivilType() {
    return privilType;
  }

  public void setName(String name) {
    this.name = name;
  }

  public void setNamespaceId(long namespaceId) {
    this.namespaceId = namespaceId;
  }

  public void setPrivilType(String privilType) {
    this.privilType = privilType;
  }

  public String toString() {
    return toStringHelper().add("namespaceId", namespaceId).add("privilType", privilType)
        .add("name", name).toString();
  }
}
