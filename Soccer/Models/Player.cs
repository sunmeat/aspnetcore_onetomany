using System.ComponentModel.DataAnnotations;

namespace Soccer.Models
{   
    public class Player
    {
        public int Id { get; set; }

        [Display(Name = "Ім'я гравця")]
        public string? Name { get; set; }

        [Display(Name = "Вік гравця")]
        public int Age { get; set; }

        [Display(Name = "Позиція")]
        public string? Position { get; set; }
        public int TeamId { get; set; } // це поле потрібно для комбобокса з назвами команд

        [Display(Name = "Назва команди")]
        public Team? Team { get; set; }
    }
}