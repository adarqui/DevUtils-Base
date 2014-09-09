# EC2
node jsonp.js "http://a0.awsstatic.com/pricing/1/ec2/linux-od.min.js?callback=callback&_=1410241437989" > EC2-Linux-OnDemand.json
node jsonp.js "http://a0.awsstatic.com/pricing/1/ec2/linux-ri-light.min.js?callback=callback&_=1410241437995" > EC2-Linux-RI-Light.json
node jsonp.js "http://a0.awsstatic.com/pricing/1/ec2/linux-ri-medium.min.js?callback=callback&_=1410241437995" > EC2-Linux-RI-Medium.json
node jsonp.js "http://a0.awsstatic.com/pricing/1/ec2/linux-ri-heavy.min.js?callback=callback&_=1410241437995" > EC2-Linux-RI-Heavy.json
# EBS/Data
node jsonp.js "http://a0.awsstatic.com/pricing/1/ec2/pricing-data-transfer-with-regions.min.js?callback=callback&_=1410241438014" > Data-Transfer.json
node jsonp.js "http://a0.awsstatic.com/pricing/1/ec2/pricing-ebs-optimized-instances.min.js?callback=callback&_=1410241438015" > EBS-Optimised.json
node jsonp.js "http://a0.awsstatic.com/pricing/1/ebs/pricing-ebs.min.js?callback=callback&_=1410241438016" > EBS.json
# RDS
node jsonp.js "http://a0.awsstatic.com/pricing/1/rds/mysql/pricing-standard-deployments.min.js?callback=callback&_=1410243958625" > RDS-MySQL-Standard2.json
