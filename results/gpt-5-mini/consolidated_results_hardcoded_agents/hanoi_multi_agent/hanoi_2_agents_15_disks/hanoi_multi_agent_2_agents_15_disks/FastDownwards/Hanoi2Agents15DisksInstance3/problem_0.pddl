(define (problem hanoi-5-agent1)
  (:domain tower-of-hanoi-agent1)
  (:objects
    a b c d e - disk
    pegleft pegmiddle pegright - peg
    ;; note: peg and disk are subtypes of place by the domain typing
  )
  (:init
    ;; initial stack on pegleft: from top to bottom a on b on c on d on e on pegleft
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e pegleft)

    ;; clear predicates: only the top disk and empty pegs are clear
    (clear a)
    (clear pegmiddle)
    (clear pegright)

    ;; pegleft is not clear initially (has e on it)
    ;; disks b, c, d, e are not clear (each has a disk above, except e is supporting d)
    ;; We don't assert negative facts explicitly here; the absence of (clear ...) for them suffices.

    ;; size ordering (static)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)
  )
  (:goal (and
    (on a pegright)
    (on b pegright)
    (on c pegright)
    (on d pegright)
    (on e pegright)
  ))
)