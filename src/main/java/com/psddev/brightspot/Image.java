package com.psddev.brightspot;

import com.psddev.cms.db.Content;
import com.psddev.cms.db.Renderer;
import com.psddev.cms.db.ToolUi;
import com.psddev.dari.db.Recordable.PreviewField;
import com.psddev.dari.util.StorageItem;
import com.psddev.dari.util.StringUtils;
import com.psddev.dari.util.ObjectUtils;
import java.util.*;
import com.psddev.dari.db.ColorImage;

 // The Dari type StorageItem allows files to be uploaded
 // and stored in the default storage defined in your
 // tomcat context.xml.

 // To use the storage item to preview the object in the
 // CMS the annotation @PreviewField("file") is used,
 // where "file" is the name of the property.

 // The @ToolUi.Referenceable annotation specifies that
 // the object can be added to rich text areas as an
 // enhancement.

 // ColorImage allows searching by color.

 // ArticleLead is an interface that groups content
 // that can be placed into that section of an Article.

@ToolUi.Referenceable
@Renderer.Path("/render/common/image.jsp")
@PreviewField("file")
public class Image extends Content implements ColorImage, ArticleLead {

	@Indexed
    @Required
	private String name;
	@Required
	private StorageItem file;
	@ToolUi.Placeholder(dynamicText = "${content.name}", editable=true)
	// @ToolUi.NoteHtml("<span data-dynamic-html='<strong>${content.name}</strong> will be used as altText if this is left blank'></span>")
	private String altText;
	private String caption;
	private List<Tag> tags;

	@Override
	public StorageItem getColorImage() {
		return file;
	} 

	public String getAltText(){
		return altText;
	}
	
	public void setAltText(String altText){
		this.altText = altText;
	}

	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}

	public String getCaption(){
		return caption;
	}
	
	public void setCaption(String caption){
		this.caption = caption;
	}

	public StorageItem getFile(){
		return file;
	}
	
	public void setFile(StorageItem file){
		this.file = file;
	}

	public List<Tag> getTags(){
		return tags;
	}

	public void setTags(List<Tag> tags){
		this.tags = tags;
	}

    public String getUrl() {
	    if (file != null && file.getPublicUrl() != null) {
	        return file.getPublicUrl().toString();
	    } else {
	        return null;
	    }

	}
	/* Before Save bulk upload filename to name field.*/
	
    @Override
    public void beforeSave() {
        // When images are added in bulk
        if (StringUtils.isBlank(name)) {
            if (file != null) {
                Map<String, Object> metadata = file.getMetadata();
                if (!ObjectUtils.isBlank(metadata)) {
                    String fileName = (String) metadata.get("originalFilename");
                    if (!StringUtils.isEmpty(fileName)) {
                        name = fileName;
                    }
                }
            }
        }

	/* Before Save for name field as altText field - ToolUi.Placeholder in the CMS indicates this for the editor .*/

	    // this.altText = StringUtils.toNormalized(name);
	    
	    // }

	    // public String toString() {
	    //     return altText;
	}

}