using System.ComponentModel.DataAnnotations;

namespace Soccer.Models
{   
    public class Team
    {
        public Team()
        {
            Players = new HashSet<Player>();
        }

        public int Id { get; set; }

        [Display(Name = "Назва команди")]
        public string? Name { get; set; }

        [Display(Name = "Тренер")]
        public string? Coach { get; set; }

        public ICollection<Player>? Players { get; set; }
    }
}