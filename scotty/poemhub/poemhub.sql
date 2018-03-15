-- sqlite3 poemhub.db < poemhub.sql


CREATE TABLE poems (
  id INTEGER PRIMARY KEY,
  author TEXT,
  title TEXT,
  year INTEGER,
  body TEXT
);


INSERT INTO poems VALUES(0, 'William Blake', 'Cradle song', 1789,
'Sleep, sleep, beauty bright,
Dreaming in the joys of night;
Sleep, sleep; in thy sleep
Little sorrows sit and weep.

Sweet babe, in thy face
Soft desires I can trace,
Secret joys and secret smiles,
Little pretty infant wiles.

As thy softest limbs I feel,
Smiles as of the morning steal
O''er thy cheek, and o''er thy breast
Where thy little heart doth rest.

O the cunning wiles that creep
In thy little heart asleep!
When thy little heart doth wake,
Then the dreadful night shall break.');


INSERT INTO poems VALUES(3, 'Walt Whitman', 'O Captain! My Captain!', 1865,
'O CAPTAIN! my Captain! our fearful trip is done;
The ship has weather''d every rack, the prize we sought is won;
The port is near, the bells I hear, the people all exulting,
While follow eyes the steady keel, the vessel grim and daring:
But O heart! heart! heart!
O the bleeding drops of red,
Where on the deck my Captain lies,
Fallen cold and dead.

O Captain! my Captain! rise up and hear the bells;
Rise up-for you the flag is flung-for you the bugle trills;
For you bouquets and ribbon''d wreaths-for you the shores a-crowding;
For you they call, the swaying mass, their eager faces turning;
Here Captain! dear father!
This arm beneath your head;
It is some dream that on the deck,
You''ve fallen cold and dead.

My Captain does not answer, his lips are pale and still;
My father does not feel my arm, he has no pulse nor will;
The ship is anchor''d safe and sound, its voyage closed and done;
From fearful trip, the victor ship, comes in with object won;
Exult, O shores, and ring, O bells!
But I, with mournful tread,
Walk the deck my Captain lies,
Fallen cold and dead. ');


INSERT INTO poems VALUES(4, 'Oscar Wilde', 'Sonnet To Liberty', 1881,
'These are the letters which Endymion wrote
To one he loved in secret, and apart.
And now the brawlers of the auction mart
Bargain and bid for each poor blotted note,
Ay! for each separate pulse of passion quote
The merchant''s price. I think they love not art
Who break the crystal of a poet''s heart
That small and sickly eyes may glare and gloat.

Is it not said that many years ago,
In a far Eastern town, some soldiers ran
With torches through the midnight, and began
To wrangle for mean raiment, and to throw
Dice for the garments of a wretched man,
Not knowing the God''s wonder, or His woe?');

