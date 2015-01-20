//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataLayer
{
    using System;
    using System.Collections.Generic;
    
    public partial class Category
    {
        public Category()
        {
            this.Firms = new HashSet<Firm_Category>();
            this.Products = new HashSet<Product_Category>();
            this.ChildCategories = new HashSet<Category>();
        }
    
        public int ID { get; set; }
        public Nullable<int> ParentCategoryID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
    
        public virtual ICollection<Firm_Category> Firms { get; set; }
        public virtual ICollection<Product_Category> Products { get; set; }
        public virtual ICollection<Category> ChildCategories { get; set; }
        public virtual Category ParentCategory { get; set; }
    }
}