list_bucket_policy = <<EOF
{
"Version": "2012-10-17",
"Statement": [
    {
    "Action": [
        "s3:ListAllMyBuckets"
    ],
    "Effect": "Allow",
    "Resource": "*"
    }
]
}
EOF

get_bucket_location_policy = <<EOF
{
"Version": "2012-10-17",
"Statement": [
    {
    "Action": [
        "s3:GetBucketLocation"
    ],
    "Effect": "Allow",
    "Resource": "*"
    }
]
}
EOF

trusted_role_services = ["firehose.amazonaws.com"]
