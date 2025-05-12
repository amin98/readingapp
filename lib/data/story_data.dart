import '../models/story.dart';

final List<Story> hardcodedStories = [
  Story(
    id: "through_dusk",
    title: "Through Dusk",
    imageAsset: 'assets/story_images/through_dusk.png',
    contentPages: [
      "The low buzz of fluorescent lights filled the sterile doctor's office, casting a pale wash over the linoleum floor and beige walls. Walter sat slouched in a rigid plastic chair, his posture slack, eyelids heavy with fatigue.",
      "Across the room, Dr. Belknap spoke in a calm, measured tone, but the words came through as if muffled by water: \"stage-three lung cancer...\". Walter sat slouched in a rigid chair, the diagnosis echoing in the quiet room.",
      "He thought of all the things he hadn\'t done, the places he hadn\'t seen. Two years. It felt like a blink, an impossibly short breath before an eternal silence. The fluorescent lights hummed on, indifferent.",
      "\"There are treatment options, Walter,\" Dr. Belknap continued, his voice gentle. \"We can fight this. We can extend...\"",
      "Walter barely heard him. His mind was already far away, racing through a lifetime of memories and regrets, a whirlwind of 'what ifs' and 'if onlys'.",
    ],
    boltLevels: [0.2, 0.4, 0.6, 0.8, 1.0],
    coinsPerPage: [5, 5, 10, 10, 20],
  ),
  Story(
    id: "fake_pines",
    title: "Fake Pines",
    imageAsset: 'assets/story_images/fake_pines.png',
    contentPages: [
      "The scent of pine was the first thing Alex noticed, sharp and artificial. It clung to the air in the sterile lobby of 'Evergreen Escapes,' a company promising immersive nature simulations. Alex clutched a worn brochure, its glossy images of tranquil forests a stark contrast to the city smog outside.",
      "A receptionist with a practiced smile checked Alex in. \"Welcome to your digital detox, Mr. Harrison. Your cabin simulation, 'Whispering Pines,' is ready. Remember, all sensations are perfectly replicated for your enjoyment and relaxation.\"",
      "Stepping into the pod, the world dissolved. The artificial pine scent intensified, and a gentle breeze, too perfect to be real, rustled unseen leaves. Alex opened their eyes to a hyper-realistic forest, but an uncanny stillness, a lack of true wildness, began to prickle at the edges of perception.",
    ],
    boltLevels: [0.33, 0.66, 1.0],
    coinsPerPage: [5, 10, 15],
  ),
  Story(
    id: "tunnel_vision",
    title: "Tunnel Vision",
    imageAsset: 'assets/story_images/tunnel_vision.png',
    contentPages: [
      "The old mine shaft was dark and foreboding, the entrance a gaping maw in the hillside. Elias hesitated, his lantern casting flickering shadows that danced like nervous spirits. He\'d heard the stories, of course – tales of gold, and of something else, something ancient and best left undisturbed.",
      "But the lure of treasure, the promise of a life beyond a dusty farm, was too strong. He took a deep breath, the air cool and damp, and stepped inside. The tunnel sloped downwards, the light from his lantern barely pushing back the oppressive darkness.",
      "Drip. Drip. Drip. Water echoed from somewhere ahead. The silence was otherwise absolute, broken only by the crunch of his boots on loose gravel. Each step felt like a gamble, a move deeper into the unknown. He told himself it was just a tunnel, just rock and earth. But a prickling sensation on his neck suggested otherwise.",
    ],
    boltLevels: [0.33, 0.66, 1.0],
    coinsPerPage: [5, 10, 10],
  ),
  Story(
    id: "hidden_path",
    title: "Hidden Path",
    imageAsset: 'assets/story_images/hidden_path.png',
    contentPages: [
      "The old map, brittle with age, spoke of a path no longer visible to the naked eye, a route through the Whispering Woods that led to a forgotten sanctuary. Elara, a cartographer with a penchant for the lost, was determined to find it.",
      "Days turned into a week as she hacked through dense undergrowth, deciphering cryptic symbols on the map against the confusing reality of the woods. The trees themselves seemed to conspire against her, their branches gnarled and tangled, their shadows deep and deceptive.",
      "Finally, a peculiar rock formation, almost swallowed by ivy, matched a sketch on her map. Behind it, almost invisible, was a narrow opening. Heart pounding, Elara pushed through the curtain of leaves, stepping onto a path that felt untouched by time.",
    ],
    boltLevels: [0.33, 0.66, 1.0],
    coinsPerPage: [7, 7, 14],
  ),
  Story(
    id: "echoing_steps",
    title: "Echoing Steps",
    imageAsset: 'assets/story_images/echoing_steps.png',
    contentPages: [
      "In the grand, empty halls of the manor, every footstep seemed to have a dozen ghostly companions. Young Thomas, the new caretaker, tried to ignore the unsettling echoes, attributing them to the old house\'s acoustics.",
      "But the echoes weren\'t always his own. Sometimes, they came from empty rooms, or from corridors he knew he hadn\'t traversed. They were lighter, quicker, sometimes almost playful, other times mournful and slow.",
      "One night, a particularly distinct set of steps led him to the dusty nursery, a room untouched for decades. In the center, a lone rocking horse swayed gently, as if a small, unseen hand had just pushed it. The echoing steps stopped. Thomas wasn\'t alone.",
    ],
    boltLevels: [0.33, 0.66, 1.0],
    coinsPerPage: [6, 6, 12],
  ),
  Story(
    id: "somewhere_not_here",
    title: "Somewhere Not Here",
    imageAsset: 'assets/story_images/somewhere_not_here.png',
    contentPages: [
      "The portal shimmered, a tear in the fabric of reality, promising a world unlike any Maya had ever known. It was a one-way trip, a desperate gamble to escape a dying Earth.",
      "She clutched her small bag of essentials, the weight of her decision heavy on her shoulders. Behind her, the grey, crumbling city; before her, an iridescent swirl of colors that hinted at alien landscapes and unknown dangers.",
      "Taking a final breath of polluted air, Maya stepped through. The sensation was like falling through stars. When she opened her eyes, she was standing on grass the color of amethyst, under a sky with two suns. She was somewhere else. She was somewhere not here.",
    ],
    boltLevels: [0.33, 0.66, 1.0],
    coinsPerPage: [8, 8, 16],
  ),
];

// Helper function to get a story by its ID
Story? getStoryDetailsById(String id) {
  try {
    return hardcodedStories.firstWhere((story) => story.id == id);
  } catch (e) {
    return null; // Story not found
  }
}
