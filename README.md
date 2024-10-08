cd website
aws s3 sync . s3://www.creetz.com

# Personal Website DevOps Project

This project sets up a personal website with multiple pages, hosted on AWS S3 and distributed via CloudFront, using Terraform for infrastructure management and GitHub Actions for continuous deployment.

## Repository Structure

```
your-repo/
├── website/
│   ├── index.html
│   ├── experiences.html
│   ├── blog/
│   │   ├── index.html
│   │   ├── post1.html
│   │   └── post2.html
│   ├── styles.css
│   └── ...
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── .github/
│   └── workflows/
│       └── deploy.yml
└── README.md
```

## Setup Instructions

### 1. Prerequisites

- AWS Account
- GitHub Account
- Registered Domain Name
- Terraform installed locally (for testing)

### 2. Repository Setup

1. Create a new GitHub repository.
2. Clone the repository to your local machine.
3. Create the folder structure as shown above.
4. Add your website files to the `website/` directory.

### 3. Terraform Configuration

1. Navigate to the `terraform/` directory.
2. Create `main.tf`, `variables.tf`, and `outputs.tf` files.
3. Copy the Terraform configuration provided in the project setup into these files.
4. Update the `bucket_name` and `domain_name` variables in `variables.tf` to match your project.

### 4. GitHub Actions Workflow

1. Create a `.github/workflows/deploy.yml` file in your repository.
2. Copy the provided GitHub Actions workflow into this file.
3. Update the `bucket_name` and `domain_name` in the workflow file to match your project.

### 5. AWS Credentials

1. Create an IAM user in AWS with appropriate permissions for S3, CloudFront, and ACM.
2. Go to your GitHub repository > Settings > Secrets.
3. Add the following secrets:
   - `AWS_ACCESS_KEY_ID`: Your AWS access key
   - `AWS_SECRET_ACCESS_KEY`: Your AWS secret key

### 6. Domain Configuration

After running the Terraform configuration for the first time:

1. Go to your domain registrar and update the nameservers to point to Route 53 (if not already done).
2. In AWS Route 53, create a new hosted zone for your domain if you haven't already.
3. Add the following DNS records:
   - A record: Alias to the CloudFront distribution
   - CNAME record: `www.your-domain.com` pointing to `your-domain.com`

## Deployment

1. Commit and push your changes to the `main` branch of your GitHub repository.
2. GitHub Actions will automatically trigger the deployment process.
3. The workflow will:
   - Set up AWS credentials
   - Initialize and apply Terraform configuration
   - Sync website files to S3
   - Invalidate CloudFront cache

## Maintenance

### Adding New Pages

1. Create new HTML files in the `website/` directory or its subdirectories.
2. Update navigation links in existing pages to include the new page.
3. Commit and push your changes. GitHub Actions will automatically deploy the updates.

### Updating Infrastructure

1. Modify the Terraform files in the `terraform/` directory as needed.
2. Commit and push your changes. GitHub Actions will apply the new infrastructure configuration.

### Troubleshooting

- Check GitHub Actions logs for any deployment errors.
- Verify AWS credentials are correctly set in GitHub Secrets.
- Ensure Terraform state is not corrupted (consider using remote state with S3 backend for collaboration).

## Security Considerations

- Keep your AWS credentials secure and never commit them to the repository.
- Regularly rotate your AWS access keys.
- Consider implementing least privilege access for your IAM user.

## Cost Considerations

This setup uses AWS services that may incur costs:

- S3 storage and data transfer
- CloudFront data transfer and requests
- Route 53 hosted zone and queries
- ACM (free for public certificates)

Monitor your AWS billing dashboard to keep track of costs.
