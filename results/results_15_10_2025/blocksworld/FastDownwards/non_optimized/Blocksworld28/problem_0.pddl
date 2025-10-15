(define (problem combined-vowel-consonant-problem)
  (:domain combined-vowel-consonant)

  (:objects
    a b c d e f g h i j k l m
  )

  (:init
    ;; Which agent can move which blocks
    (vowel a)
    (vowel e)
    (vowel i)

    (consonant b)
    (consonant c)
    (consonant d)
    (consonant f)
    (consonant g)
    (consonant h)
    (consonant j)
    (consonant k)
    (consonant l)
    (consonant m)

    ;; Initial stacks (combined from both agents; names unified to lowercase)
    ;; Stack with base e on the table: e bottom then l then f then c then m then k top.
    (ontable e)
    (on l e)
    (on f l)
    (on c f)
    (on m c)
    (on k m)

    ;; Stack with base h on the table: h bottom then a then b then d then i top.
    (ontable h)
    (on a h)
    (on b a)
    (on d b)
    (on i d)

    ;; Stack with base j on the table: j bottom then g top.
    (ontable j)
    (on g j)

    ;; clear blocks (those with nothing on top)
    (clear k)
    (clear i)
    (clear g)
  )

  ;; Goal: single stack with m on the table and above it in order
  ;; l, k, j, i, h, g, f, e, d, c, b, a (a on top)
  (:goal
    (and
      (ontable m)
      (on l m)
      (on k l)
      (on j k)
      (on i j)
      (on h i)
      (on g h)
      (on f g)
      (on e f)
      (on d e)
      (on c d)
      (on b c)
      (on a b)
    )
  )
)