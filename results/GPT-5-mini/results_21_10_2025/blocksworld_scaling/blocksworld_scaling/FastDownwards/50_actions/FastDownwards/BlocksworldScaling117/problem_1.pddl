(define (problem BlocksworldScaling117-problem)
  (:domain blocks-two-agents)

  (:objects
    a b c d e f g h i j - block
  )

  (:init
    ;; initial stacked configuration (from human specification)
    ;; stack 1: f (table) - a - d (top)
    (on a f)
    (on d a)
    (on-table f)

    ;; stack 2: i (table) - g - h - c (top)
    (on g i)
    (on h g)
    (on c h)
    (on-table i)

    ;; stack 3: e (table) - j - b (top)
    (on j e)
    (on b j)
    (on-table e)

    ;; clear predicates: only top blocks are clear initially
    (clear d)
    (clear c)
    (clear b)

    ;; agent block classifications
    (vowel-block a)
    (vowel-block e)
    (vowel-block i)

    (consonant-block b)
    (consonant-block c)
    (consonant-block d)
    (consonant-block f)
    (consonant-block g)
    (consonant-block h)
    (consonant-block j)
  )

  ;; global goal (as specified): form one tall stack A on B on C on D on E on F on G on H on I on J (J on table)
  (:goal (and
           (on a b)
           (on b c)
           (on c d)
           (on d e)
           (on e f)
           (on f g)
           (on g h)
           (on h i)
           (on i j)
           (on-table j)
         )
  )
)