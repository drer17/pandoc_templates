# Use the Pandoc Docker image as the base image
FROM pandoc/latex:latest

# Create a directory for your custom template file
WORKDIR /custom_templates
COPY custom_basic.latex /custom_templates/

# Set the working directory for your Markdown files
WORKDIR /data

# Entry point: Convert the Markdown file to PDF using the custom template
ENTRYPOINT ["pandoc", "--template=/custom_templates/custom_basic.latex", "--listings"]

# Default command: This can be overridden when running the container
CMD ["input_file.md", "-o", "output_file.pdf"]
