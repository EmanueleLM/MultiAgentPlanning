(define (problem hanoi-6-disks)
  (:domain hanoi)

  (:objects
    ;; disks (A = smallest, F = largest). Use lowercase identifiers for solver compatibility.
    a b c d e f - disk
    left middle right - peg
    left-agent middle-agent right-agent - agent
  )

  ;; Initial configuration:
  ;; All disks stacked on 'left' peg with f at bottom and a at top:
  ;; on a b, on b c, on c d, on d e, on e f, on f left
  ;; 'a' is the topmost disk => clear a
  ;; 'middle' and 'right' pegs are empty => clear middle, clear right
  ;; The 'smaller' relation encodes disk size ordering (a < b < c < d < e < f)
  ;; and also declares that every disk is smaller than every peg (so any disk may be placed on an empty peg).
  (:init
    ;; direct support relations (stack on left)
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f left)

    ;; clear facts: only the top disk and empty pegs are clear initially
    (clear a)
    (clear middle)
    (clear right)

    ;; size ordering among disks (smaller X Y means X is smaller than Y)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f)
    (smaller c d) (smaller c e) (smaller c f)
    (smaller d e) (smaller d f)
    (smaller e f)

    ;; every disk is smaller than every peg (pegs are "larger" than disks)
    (smaller a left) (smaller a middle) (smaller a right)
    (smaller b left) (smaller b middle) (smaller b right)
    (smaller c left) (smaller c middle) (smaller c right)
    (smaller d left) (smaller d middle) (smaller d right)
    (smaller e left) (smaller e middle) (smaller e right)
    (smaller f left) (smaller f middle) (smaller f right)

    ;; (optional) agent responsibility facts coming from the peg agents' local reports.
    ;; These are provided as static observations (not required by the move operator, but recorded).
    ( ; these are plain facts to reflect the three peg agents' local-state responsibilities
    )
  )

  ;; Goal: move the entire stack from 'left' to 'right' preserving the order (f bottom ... a top).
  (:goal (and
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f right)
  ))
)