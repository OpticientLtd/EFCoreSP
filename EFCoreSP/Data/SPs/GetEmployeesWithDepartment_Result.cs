namespace EFCoreSP.Data.SPs
{
    public class GetEmployeesWithDepartment_Result
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int DepartmentId { get; set; }
        public int? ManagerId { get; set; }
        public int Salary { get; set; }
        public decimal? Bonus { get; set; }
        public string Department { get; set; }

    }
}
