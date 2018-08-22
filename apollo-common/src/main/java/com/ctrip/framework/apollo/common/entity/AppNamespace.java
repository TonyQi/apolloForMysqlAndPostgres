package com.ctrip.framework.apollo.common.entity;


import com.ctrip.framework.apollo.core.enums.ConfigFileFormat;

import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "appnamespace")
@SQLDelete(sql = "Update appnamespace set isdeleted = 1 where id = ?")
@Where(clause = "isdeleted = 0")
public class AppNamespace extends BaseEntity {

  @Column(name = "name", nullable = false)
  private String name;

  @Column(name = "appid", nullable = false)
  private String appId;

  @Column(name = "format", nullable = false)
  private String format;

  @Column(name = "ispublic", columnDefinition = "Bit default '0'")
  private boolean isPublic = false;

  @Column(name = "comment")
  private String comment;

  public String getAppId() {
    return appId;
  }

  public String getComment() {
    return comment;
  }

  public String getName() {
    return name;
  }

  public void setAppId(String appId) {
    this.appId = appId;
  }

  public void setComment(String comment) {
    this.comment = comment;
  }

  public void setName(String name) {
    this.name = name;
  }

  public boolean isPublic() {
    return isPublic;
  }

  public void setPublic(boolean aPublic) {
    isPublic = aPublic;
  }

  public ConfigFileFormat formatAsEnum() {
    return ConfigFileFormat.fromString(this.format);
  }

  public String getFormat() {
    return format;
  }

  public void setFormat(String format) {
    this.format = format;
  }

  public String toString() {
    return toStringHelper().add("name", name).add("appId", appId).add("comment", comment)
        .add("format", format).add("isPublic", isPublic).toString();
  }
}
