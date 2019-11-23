set -e
# Get a carriage return into `cr`
cr=`echo $'\n.'`
cr=${cr%.}


# Parse arguments
content_image="$1"
content_dir=$(dirname "$content_image")
content_filename=$(basename "$content_image")

style_image="$2"
style_dir=$(dirname "$style_image" )
style_filename=$(basename "$style_image")

OUTPUT_DIR="/mnt/efsvol/neural-style-tf/output"
OUTPUT_FILENAME="${content_filename}.${style_filename}"

echo "Rendering $OUTPUT_FILENAME..."
python3 -u neural_style.py \
--content_img "${content_filename}" \
--content_img_dir "${content_dir}" \
--style_imgs "${style_filename}" \
--style_imgs_dir "${style_dir}" \
--device "/gpu:0" \
--img_output_dir "${OUTPUT_DIR}" \
--img_name "$OUTPUT_FILENAME" \
--verbose >> "$OUTPUT_DIR/log";

# mv "$OUTPUT_DIR/"