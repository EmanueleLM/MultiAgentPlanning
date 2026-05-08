(define (problem Hanoi2Agents10DisksInstance28-problem)
  (:domain hanoi-2agents-10)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
  )
  (:init
    ;; initial configuration: all disks on left (top->bottom A..J)
    (on A left)
    (on B left)
    (on C left)
    (on D left)
    (on E left)
    (on F left)
    (on G left)
    (on H left)
    (on I left)
    (on J left)
  )
  (:goal (and
    ;; goal requires these disks to be on the specified pegs.
    ;; The domain actions prohibit illegal larger-on-smaller placements,
    ;; so reaching these on-facts implies the intended top-to-bottom ordering.
    (on E left)
    (on F left)
    (on G left)
    (on H left)
    (on I left)
    (on J left)
    (on A middle)
    (on D middle)
    (on B right)
    (on C right)
  ))
)