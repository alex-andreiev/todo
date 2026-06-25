# frozen_string_literal: true

Rails.logger.debug 'Updating database seeds...'

Rails.logger.debug 'Ensuring admin user exists...'
user = User.find_or_create_by!(email: 'admin@example.com') do |u|
  u.password = 'password123'
  u.password_confirmation = 'password123'
  u.roles_mask = 2
end
user.update!(password: 'password123', roles_mask: 2)

list_data = {
  'Work Projects' => [
    'Finalize Q3 roadmap', 'Review pull requests', 'Prepare presentation for stakeholders',
    'Update documentation', 'Schedule team sync', 'Research competitor features',
    'Draft project proposal', 'Refactor auth module', 'Fix critical bug in checkout',
    'Optimize database queries', 'Coordinate with design team', 'Write unit tests for API',
    'Setup CI/CD pipeline', 'Conduct code review', 'Update Jira tickets', 'Clean up git branches',
    'Prepare weekly report', 'Plan next sprint', 'Analyze user feedback', 'Update README.md'
  ],

  'Home Maintenance' => [
    'Fix leaky faucet in kitchen', 'Change HVAC filter', 'Mow the lawn', 'Clean gutters',
    'Paint guest bedroom', 'Oil the deck', 'Replace lightbulbs in hallway', 'Deep clean carpets',
    'Organize garage', 'Check smoke detector batteries', 'Wash windows', 'Prune rose bushes',
    'Fix loose floorboard', 'Clean oven', 'Declutter attic', 'Service the water heater',
    'Touch up wall paint', 'Clean refrigerator coils', 'Dust ceiling fans', 'Sweep porch'
  ],
  'Health & Fitness' => [
    'Morning 5km run', 'Weekly meal prep', 'Gym session: Leg day', 'Yoga for 30 mins',
    'Schedule dentist appointment', 'Drink 2L of water daily', 'Meditate for 10 mins', 'Track calories',
    'Buy new running shoes', 'Vitamin supplements', 'Walk 10k steps', 'Gym session: Upper body',
    'Sleep 8 hours', 'Limit sugar intake', 'Stretch before bed', 'Plan workout routine',
    'Book physiotherapy session', 'Eye exam', 'Blood test results review', 'Prepare healthy snacks'
  ],
  'Learning/Education' => [
    'Read 2 chapters of Ruby book', 'Complete React course module', 'Practice SQL queries', 'Listen to tech podcast',
    'Write a blog post about Rails 8', 'Study system design', 'Watch AWS tutorial', 'Practice LeetCode',
    'Learn about Propshaft', 'Update LinkedIn profile', 'Attend webinar on AI', 'Review Docker basics',
    "Read 'Clean Code' chapter 3", 'Practice CSS Grid', 'Explore Hotwire', 'Take notes on architectural patterns',
    'Research GraphQL', 'Complete certification exam', 'Join developer community', 'Practice TDD'
  ],
  'Finance/Bills' => [
    'Pay electricity bill', 'Review monthly budget', 'Transfer to savings', 'Check credit score',
    'Pay internet bill', 'Organize tax receipts', 'Review insurance policy', 'Pay phone bill',
    'Set up automatic transfers', 'Analyze spending habits', 'Pay rent/mortgage', 'Renew car registration',
    'Check investment portfolio', 'Plan for vacation savings', 'Pay water bill', 'Update passwords for banks',
    'Research high-yield savings', 'Pay credit card balance', 'Audit subscriptions', 'Review pension plan'
  ],
  'Travel Planning' => [
    'Research flights to Tokyo', 'Book hotel in Shibuya', 'Create itinerary', 'Renew passport',
    'Buy travel insurance', 'Pack suitcase', 'Research local restaurants', 'Book museum tickets',
    'Exchange currency', 'Download offline maps', 'Check visa requirements', 'Make a packing list',
    'Book airport transfer', 'Research sightseeing spots', 'Buy travel adapter', 'Coordinate with travel buddy',
    'Set out-of-office email', 'Arrange pet sitting', 'Check weather forecast', 'Read travel guides'
  ],
  'Social/Events' => [
    'Buy birthday gift for Sarah', 'Plan dinner party', 'Call parents', 'RSVP to wedding',
    'Organize game night', 'Send thank you cards', 'Plan weekend trip', 'Catch up with old friends',
    'Buy concert tickets', 'Coordinate baby shower', 'Send holiday greetings', 'Plan anniversary dinner',
    'Book bowling alley', 'Set up coffee date', 'Organize book club', 'Buy flowers for event',
    'Draft guest list', 'Coordinate transport', 'Send invites', 'Plan party menu'
  ],
  'Shopping/Errands' => [
    'Buy groceries', 'Pick up dry cleaning', 'Go to post office', 'Pharmacy visit',
    'Buy new lightbulbs', 'Return Amazon package', 'Get car washed', 'Buy printer ink',
    'Grocery store: produce', 'Grocery store: dairy', 'Hardware store visit', 'Buy stamps',
    'Pick up laundry', 'Visit bank', 'Buy birthday card', 'Update wardrobe',
    'Buy kitchen towels', 'Get haircuts', 'Visit library', 'Buy batteries'
  ],
  'Hobbies/Creative' => [
    'Paint landscape', 'Practice guitar', 'Write a short story', 'Start new puzzle',
    'Read poetry', 'Photography walk', 'Learn new recipe', 'Sketch in park',
    'Update portfolio', 'Bake sourdough', 'Experiment with watercolor', 'Record a song',
    'Read about art history', 'Clean paint brushes', 'Buy new sketchbook', 'Research pottery',
    'Watch a classic movie', 'Write in journal', 'Build LEGO set', 'Collect vintage stamps'
  ],
  'Reading List' => [
    "Read 'Atomic Habits'", "Finish 'The Pragmatic Programmer'",
    "Read 'Designing Data-Intensive Applications'", "Read 'Refactoring'",
    "Read 'Clean Architecture'", 'Explore tech newsletters', 'Read industry whitepapers', 'Read a biography',
    "Read 'The Lean Startup'", "Read 'Psychology of Money'", 'Read a mystery novel', 'Read a sci-fi novel',
    "Read 'Thinking, Fast and Slow'", 'Review saved articles', 'Read a philosophy book', 'Read a history book',
    "Read 'Soft Skills'", 'Finish the current magazine', 'Read a poetry collection', 'Read a graphic novel'
  ],
  'Digital Cleanup' => [
    'Organize desktop folders', 'Clean email inbox', 'Backup photos to cloud', 'Uninstall unused apps',
    'Sort downloads folder', 'Update OS', 'Clear browser cache', 'Delete duplicate files',
    'Organize bookmarks', 'Update password manager', 'Clear old screenshots', 'Archive old projects',
    'Optimize disk space', 'Review cloud storage', 'Sync devices', 'Clean up contacts',
    'Unsubscribe from spam', 'Review security settings', 'Organize music library', 'Clear trash bin'
  ],
  'Career Development' => [
    'Update resume', 'Write cover letter template', 'Research new roles', 'Reach out to mentors',
    'Attend networking event', 'Prepare for interviews', 'Set career goals for 2026', 'Take leadership course',
    'Improve public speaking', 'Learn about management', 'Read industry trends', 'Update GitHub profile',
    'Request feedback from boss', 'Optimize LinkedIn', 'Study for certification', 'Practice system design',
    'Research salary benchmarks', 'Build a side project', 'Write technical articles', 'Network on LinkedIn'
  ],
  'Family/Kids' => [
    'Plan family outing', 'Help with homework', 'Buy school supplies', 'Schedule doctor visit',
    'Plan kids birthday', 'Read bedtime story', 'Organize toys', 'Prepare school lunch',
    'Attend parent-teacher meeting', 'Plan summer camp', 'Buy new clothes', 'Teach a new skill',
    'Visit grandparents', 'Family movie night', 'Plan weekend activity', 'Review school grades',
    'Coordinate childcare', 'Organize family photos', 'Buy sports equipment', 'Clean play area'
  ],
  'Personal Admin' => [
    'Organize filing cabinet', 'Review insurance', 'Update emergency contacts', 'Plan annual budget',
    'File taxes', 'Schedule car service', 'Renew ID card', 'Review lease agreement',
    'Clean out wallet', 'Organize passwords', 'Update medical records', 'Plan home renovations',
    'Schedule annual checkup', 'Pay yearly memberships', 'Check mailbox', 'Organize travel documents',
    'Update will', 'Renew subscriptions', 'Review utility plans', 'Set up reminders'
  ],
  'Gift Ideas' => [
    'Buy gift for Mom', 'Find present for Dad', 'Think of gift for brother', 'Gift for sister',
    'Birthday gift for friend', 'Wedding gift idea', 'Anniversary gift', 'Christmas list',
    'Buy gift cards', 'Research unique gifts', 'Handmade gift idea', 'Plan surprise gift',
    'Buy wrapping paper', 'Write heartfelt cards', 'Gift for co-worker', 'Gift for nephew',
    'Gift for niece', 'Buy greeting cards', 'Plan gift exchange', 'Research luxury items'
  ]
}

Rails.logger.debug 'Updating lists and tasks...'
list_data.each_with_index do |(title, tasks), index|
  todo = Todo.find_or_create_by!(title: title, user: user)
  todo.update!(
    position: index,
    description: "Collection of tasks for #{title}"
  )

  tasks.each_with_index do |task_name, task_index|
    task = todo.tasks.find_or_create_by!(task: task_name)
    task.update!(
      position: task_index,
      priority: rand(0..3),
      deadline: rand(1..30).days.from_now.to_date,
      completed_at: [true, false].sample
    )
  end
  Rails.logger.debug { "Updated list: #{title} with #{tasks.size} tasks" }
end

Rails.logger.debug 'Seed completed successfully!'
Rails.logger.debug 'Admin User: admin@example.com / password123'
