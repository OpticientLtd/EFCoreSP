using System;
using System.Collections.Generic;

#nullable disable

namespace EFCoreSP.Data.Tables
{
    public partial class Employee
    {
        public Employee()
        {
            InverseManager = new HashSet<Employee>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public int DepartmentId { get; set; }
        public int? ManagerId { get; set; }
        public int Salary { get; set; }
        public decimal? Bonus { get; set; }

        public virtual Department Department { get; set; }
        public virtual Employee Manager { get; set; }
        public virtual ICollection<Employee> InverseManager { get; set; }
    }
}
