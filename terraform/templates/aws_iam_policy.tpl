{
	"Version": "2012-10-17",
	"Statement": [{
		"Effect": "Allow",
		"Action": [
			"s3:Get*",
			"s3:List*"
		],
		"Resource": [
			"arn:aws:s3:::${secrets_bucket}/*",
			"arn:aws:s3:::${secrets_bucket}"
		]
	}, {
		"Effect": "Allow",
		"Action": [
			"ecr:GetDownloadUrlForLayer",
			"ecr:BatchGetImage",
			"ecr:DescribeImages",
			"ecr:GetAuthorizationToken",
			"ecr:DescribeRepositories",
			"ecr:ListImages",
			"ecr:BatchCheckLayerAvailability",
			"ecr:GetRepositoryPolicy"
		],
		"Resource": "*"
	}]
}
