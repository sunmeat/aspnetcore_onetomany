namespace Soccer.Models
{   
    public class Players
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public int Age { get; set; }
        public string? Position { get; set; }
        public int TeamId { get; set; }
        public Teams? Team { get; set; }
    }
}
