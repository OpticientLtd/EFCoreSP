using EFCoreSP.Data;
using Microsoft.EntityFrameworkCore;
using System;

namespace EFCoreSP
{
    internal class Program
    {
        static void Main(string[] args)
        {

            var connectionString = "Server=OPTI0001\\SQLEXPRESS;Database=EFCoreSP;Trusted_Connection=True;MultipleActiveResultSets=true";
            using var dbContext = new EFCoreSPContext(new DbContextOptionsBuilder<EFCoreSPContext>().UseSqlServer(connectionString).Options);
            var employees = dbContext.SP_GetEmployeesWithDepartment(2);
            foreach (var employee in employees)
                Console.WriteLine($"Id = {employee.Id,-3} Name = {employee.Name,-20} Department = {employee.Department}");
            Console.ReadKey();
        }
    }
}
