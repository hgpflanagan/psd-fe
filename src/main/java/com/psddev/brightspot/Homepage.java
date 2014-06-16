package com.psddev.brightspot;

import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.*;
import java.util.*;

 // The CMS automatically provides the ability to set a URL by extending content.
 // Implementing Singleton means only one Homepage can exist.

 // ProductFeature is an embedded static class within Homepage.

// LayoutPath rendered the structure of the page and calls ${mainContent}
// ${mainContent} is the object - rendered by the @Renderer.Path jsp

@Renderer.Path("/render/model/homepage-object.jsp")
@Renderer.LayoutPath("/render/common/page-container.jsp")
public class Homepage extends Content implements Singleton {

	@Required
	private String name = "Homepage";
	@ToolUi.Heading("Homepage Lead")
	private String title;
	private String subTitle;
	private Image image;
	private Callouts callouts;

	@ToolUi.Heading("Description Section")
	private String sectionHeading;
	@CollectionMaximum(3)
	@CollectionMinimum(3)
	private List<Article> promoArticles;

	@ToolUi.Heading("Feature Section")
	private String newSectionHeading;
	private String newSectionSubHeading;
	private Image featureImage;
	private List<ProductFeature> newProductFeatures;

	@ToolUi.Tab("Styles")
	@ToolUi.CodeType("text/css")
	@ToolUi.Note("Hex value for header background color, example #eaeaea")
	private String headerColor;
	@ToolUi.Tab("Styles")
	@ToolUi.CodeType("text/css")
	@ToolUi.Note("Hex value for header text color, example #eaeaea")
	private String headerTextColor;


	public String getHeaderTextColor(){
		return headerTextColor;
	}
	
	public void setHeaderTextColor(String headerTextColor){
		this.headerTextColor = headerTextColor;
	}

	public String getHeaderColor(){
		return headerColor;
	}
	
	public void setHeaderColor(String headerColor){
		this.headerColor = headerColor;
	}
	 
	public List<Article> getPromoArticles(){
		return promoArticles;
	}
	
	public void setPromoArticles(List<Article> promoArticles){
		this.promoArticles = promoArticles;
	}

	public String getNewSectionSubHeading(){
		return newSectionSubHeading;
	}
	
	public void setNewSectionSubHeading(String newSectionSubHeading){
		this.newSectionSubHeading = newSectionSubHeading;
	}

	public String getNewSectionHeading(){
		return newSectionHeading;
	}
	
	public void setNewSectionHeading(String newSectionHeading){
		this.newSectionHeading = newSectionHeading;
	}

	public Image getFeatureImage(){
		return featureImage;
	}
	
	public void setFeatureImage(Image featureImage){
		this.featureImage = featureImage;
	}

	public List<ProductFeature> getNewProductFeatures(){
		return newProductFeatures;
	}
	
	public void setNewProductFeatures(List<ProductFeature> newProductFeatures){
		this.newProductFeatures = newProductFeatures;
	}

	public String getSectionHeading(){
		return sectionHeading;
	}
	
	public void setSectionHeading(String sectionHeading){
		this.sectionHeading = sectionHeading;
	}

	public Callouts getCallouts(){
		return callouts;
	}
	
	public void setCallouts(Callouts callouts){
		this.callouts = callouts;
	}

	public Image getImage(){
		return image;
	}
	
	public void setImage(Image image){
		this.image = image;
	}

	public String getSubTitle(){
		return subTitle;
	}
	
	public void setSubTitle(String subTitle){
		this.subTitle = subTitle;
	}

	public String getTitle(){
		return title;
	}
	
	public void setTitle(String title){
		this.title = title;
	}
	
	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}

	@Embedded
	public static class Callouts extends Record {

		private String leftHeading;
		private String leftDescription;
		private String rightHeading;
		private String rightDescription;

		 
		public String getLeftHeading(){
			return leftHeading;
		}
		
		public void setLeftHeading(String leftHeading){
			this.leftHeading = leftHeading;
		}

		public String getRightHeading(){
			return rightHeading;
		}
		
		public void setRightHeading(String rightHeading){
			this.rightHeading = rightHeading;
		}
	 
		public String getLeftDescription(){
			return leftDescription;
		}

		public void setLeftDescription(String leftDescription){
			this.leftDescription = leftDescription;
		}

		 
		public String getRightDescription(){
			return rightDescription;
		}

		public void setRightDescription(String rightDescription){
			this.rightDescription = rightDescription;
		}

	}

	@Embedded
	public static class ProductFeature extends Record {

		private String title;
		@ToolUi.RichText
		private String description;
		

		public String getTitle(){
			return title;
		}
		
		public void setTitle(String title){
			this.title = title;
		}


		public String getDescription(){
			return description;
		}
		
		public void setDescription(String description){
			this.description = description;
		}
	}
}