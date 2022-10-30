using EFCoreSP.Data.SPs;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;

namespace EFCoreSP.Data
{
    public partial class EFCoreSPContext : DbContext
    {
        public virtual DbSet<GetEmployeesWithDepartment_Result> GetEmployeesWithDepartment_Results { get; set; }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<GetEmployeesWithDepartment_Result>(entity =>
            entity.HasKey(e => e.Id));
        }

        public IEnumerable<GetEmployeesWithDepartment_Result> SP_GetEmployeesWithDepartment(int id)
        {
            var idParameter = new SqlParameter("id", id);
            return this.GetEmployeesWithDepartment_Results.FromSqlInterpolated($"[dbo].[GetEmployeesWithDepartment] {idParameter}").ToArray();
        }
    }
}
