namespace Soccer.Models
{   
    public class Teams
    {
        public Teams()
        {
            Players = new HashSet<Players>();
        }
    
        public int Id { get; set; }
        public string? Name { get; set; }
        public string? Coach { get; set; }
        public ICollection<Players>? Players { get; set; }
    }
}
