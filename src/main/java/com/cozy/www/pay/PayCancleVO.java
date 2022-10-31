package com.cozy.www.pay;

public class PayCancleVO {
private String merchant_uid;
private int amount;
private String imp_uid;
private int tax_free;
private int checksum;
private String reason;
public String getMerchant_uid() {
	return merchant_uid;
}
public int getAmount() {
	return amount;
}
public String getImp_uid() {
	return imp_uid;
}
public int getTax_free() {
	return tax_free;
}
public int getChecksum() {
	return checksum;
}
public String getReason() {
	return reason;
}
@Override
public String toString() {
	StringBuilder builder = new StringBuilder();
	builder.append("PayCancleVO [merchant_uid=");
	builder.append(merchant_uid);
	builder.append(", amount=");
	builder.append(amount);
	builder.append(", imp_uid=");
	builder.append(imp_uid);
	builder.append(", tax_free=");
	builder.append(tax_free);
	builder.append(", checksum=");
	builder.append(checksum);
	builder.append(", reason=");
	builder.append(reason);
	builder.append("]");
	return builder.toString();
}

}
