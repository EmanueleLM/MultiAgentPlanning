(define (problem hanoi-6)
  (:domain hanoi)
  (:requirements :typing :strips :negative-preconditions)

  (:objects
    a b c d e f - disk
    left middle right - peg
  )

  (:init
    ;; Initial stack on left: top-to-bottom a b c d e f
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f left)

    ;; clear = true for top-most disk and for empty pegs
    (clear a)
    (clear middle)
    (clear right)

    ;; Size ordering (a smallest, f largest)
    (smaller a b)
    (smaller a c)
    (smaller a d)
    (smaller a e)
    (smaller a f)

    (smaller b c)
    (smaller b d)
    (smaller b e)
    (smaller b f)

    (smaller c d)
    (smaller c e)
    (smaller c f)

    (smaller d e)
    (smaller d f)

    (smaller e f)
  )

  (:goal
    (and
      ;; Goal: same ordered stack now on right peg (top-to-bottom a..f)
      (on a b)
      (on b c)
      (on c d)
      (on d e)
      (on e f)
      (on f right)
    )
  )
)