1.	Created an Azure service principal and an Azure DevOps service connection with Contributor rights to the target resource group and access to storage account used for Terraform backend.
2.	Created the Terraform backend storage account & container ( set the variables TF_BACKEND_RG, TF_BACKEND_SA, TF_BACKEND_CONTAINER).
3.	Set pipeline variables / secrets in Azure DevOps: AZURE_SERVICE_CONNECTION, TF_VAR_rg_name, TF_VAR_aks_name, ACR_NAME, GRAFANA_API_KEY, GRAFANA_ADMIN_PASSWORD, REPORT_STORAGE_ACCOUNT, REPORT_STORAGE_KEY.
4.	Ran the pipeline. First stage will plan and run scans. Manually approve apply or run a manual pipeline to apply.
5.	After apply, build & push the app image, deploy with Helm.
6.	Monitor via Grafana, configure alert rules in Prometheus.
