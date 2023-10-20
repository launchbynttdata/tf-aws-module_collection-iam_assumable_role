# Replace the <> with the actual values
trusted_role_arns      = ["<list of arns to trust>"]
assume_iam_role_policy = <<EOF
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
