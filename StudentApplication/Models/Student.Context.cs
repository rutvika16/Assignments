﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace StudentApplication.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class StudentDbEntities : DbContext
    {
        public StudentDbEntities()
            : base("name=StudentDbEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Student> Students { get; set; }
    
        public virtual int spDelete(Nullable<int> studentId)
        {
            var studentIdParameter = studentId.HasValue ?
                new ObjectParameter("StudentId", studentId) :
                new ObjectParameter("StudentId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("spDelete", studentIdParameter);
        }
    
        public virtual int spInsert(string name, Nullable<long> mobileNumber, string emailId, string courseEnrolled, string feesStatus)
        {
            var nameParameter = name != null ?
                new ObjectParameter("Name", name) :
                new ObjectParameter("Name", typeof(string));
    
            var mobileNumberParameter = mobileNumber.HasValue ?
                new ObjectParameter("MobileNumber", mobileNumber) :
                new ObjectParameter("MobileNumber", typeof(long));
    
            var emailIdParameter = emailId != null ?
                new ObjectParameter("EmailId", emailId) :
                new ObjectParameter("EmailId", typeof(string));
    
            var courseEnrolledParameter = courseEnrolled != null ?
                new ObjectParameter("CourseEnrolled", courseEnrolled) :
                new ObjectParameter("CourseEnrolled", typeof(string));
    
            var feesStatusParameter = feesStatus != null ?
                new ObjectParameter("FeesStatus", feesStatus) :
                new ObjectParameter("FeesStatus", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("spInsert", nameParameter, mobileNumberParameter, emailIdParameter, courseEnrolledParameter, feesStatusParameter);
        }
    
        public virtual int spUpdate(Nullable<int> studentId, string name, Nullable<long> mobileNumber, string emailId, string courseEnrolled, string feesStatus)
        {
            var studentIdParameter = studentId.HasValue ?
                new ObjectParameter("StudentId", studentId) :
                new ObjectParameter("StudentId", typeof(int));
    
            var nameParameter = name != null ?
                new ObjectParameter("Name", name) :
                new ObjectParameter("Name", typeof(string));
    
            var mobileNumberParameter = mobileNumber.HasValue ?
                new ObjectParameter("MobileNumber", mobileNumber) :
                new ObjectParameter("MobileNumber", typeof(long));
    
            var emailIdParameter = emailId != null ?
                new ObjectParameter("EmailId", emailId) :
                new ObjectParameter("EmailId", typeof(string));
    
            var courseEnrolledParameter = courseEnrolled != null ?
                new ObjectParameter("CourseEnrolled", courseEnrolled) :
                new ObjectParameter("CourseEnrolled", typeof(string));
    
            var feesStatusParameter = feesStatus != null ?
                new ObjectParameter("FeesStatus", feesStatus) :
                new ObjectParameter("FeesStatus", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("spUpdate", studentIdParameter, nameParameter, mobileNumberParameter, emailIdParameter, courseEnrolledParameter, feesStatusParameter);
        }
    }
}
