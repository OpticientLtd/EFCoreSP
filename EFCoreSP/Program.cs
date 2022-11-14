using EFCoreSP.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;

namespace EFCoreSP
{
    internal class Program
    {
        static void Main(string[] args)
        {

            try
            {
                var config = new ConfigurationBuilder()
                    .AddJsonFile("appsettings.json")
                    .Build();

                using var dbContext = new EFCoreSPContext(new DbContextOptionsBuilder<EFCoreSPContext>()
                    .UseSqlServer(config.GetConnectionString(nameof(EFCoreSPContext)))
                    .Options);

                var employees = dbContext.SP_GetEmployeesWithDepartment(2);
                foreach (var employee in employees)
                    Console.WriteLine($"Id = {employee.Id,-3} Name = {employee.Name,-20} Department = {employee.Department}");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            Console.ReadKey();
        }
    }
}
