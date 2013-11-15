package com.springapp.entity;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;

/**
 * Created by Arsen Adzhiametov on 7/31/13.
 */
@Entity(name = "variant")
public class Variant {
    private int variantId;
    private String variantName;
    private Vote vote;

    @javax.persistence.Column(name = "variant_id")
    @Id
    public int getVariantId() {
        return variantId;
    }

    public void setVariantId(int variantId) {
        this.variantId = variantId;
    }

    @javax.persistence.Column(name = "variant_name")
    @Basic
    public String getVariantName() {
        return variantName;
    }

    public void setVariantName(String variantName) {
        this.variantName = variantName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Variant variant = (Variant) o;

        if (variantId != variant.variantId) return false;
        if (variantName != null ? !variantName.equals(variant.variantName) : variant.variantName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = variantId;
        result = 31 * result + (variantName != null ? variantName.hashCode() : 0);
        return result;
    }

    @OneToOne(mappedBy = "variantByVoteVariantId")
    public Vote getVote() {
        return vote;
    }

    public void setVote(Vote vote) {
        this.vote = vote;
    }

}
