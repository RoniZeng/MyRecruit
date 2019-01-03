package com.ybl.model;

/**
 * CompanyGetResumeId entity. @author MyEclipse Persistence Tools
 */

public class CompanyGetResumeId implements java.io.Serializable {

	// Fields

	private Resume resume;
	private Reciritment reciritment;

	// Constructors

	/** default constructor */
	public CompanyGetResumeId() {
	}

	/** full constructor */
	public CompanyGetResumeId(Resume resume, Reciritment reciritment) {
		this.resume = resume;
		this.reciritment = reciritment;
	}

	// Property accessors

	public Resume getResume() {
		return this.resume;
	}

	public void setResume(Resume resume) {
		this.resume = resume;
	}

	public Reciritment getReciritment() {
		return this.reciritment;
	}

	public void setReciritment(Reciritment reciritment) {
		this.reciritment = reciritment;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof CompanyGetResumeId))
			return false;
		CompanyGetResumeId castOther = (CompanyGetResumeId) other;

		return ((this.getResume() == castOther.getResume()) || (this
				.getResume() != null && castOther.getResume() != null && this
				.getResume().equals(castOther.getResume())))
				&& ((this.getReciritment() == castOther.getReciritment()) || (this
						.getReciritment() != null
						&& castOther.getReciritment() != null && this
						.getReciritment().equals(castOther.getReciritment())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getResume() == null ? 0 : this.getResume().hashCode());
		result = 37
				* result
				+ (getReciritment() == null ? 0 : this.getReciritment()
						.hashCode());
		return result;
	}

	@Override
	public String toString() {
		return "CompanyGetResumeId [resume=" + resume + ", reciritment="
				+ reciritment + "]";
	}
	
}