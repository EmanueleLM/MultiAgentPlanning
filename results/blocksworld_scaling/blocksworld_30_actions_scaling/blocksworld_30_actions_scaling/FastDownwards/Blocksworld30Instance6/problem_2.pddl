(define (problem blocks-final-sequence)
  (:domain blocks-world-seq)
  (:objects A B C D E F G H I J - block)

  (:init
    ;; initial stacks according to the specification:
    ;; Stack on table A: A <- I <- C <- J <- D <- G <- H
    (ontable A)
    (on I A)
    (on C I)
    (on J C)
    (on D J)
    (on G D)
    (on H G)

    ;; Stack on table B: B <- F <- E
    (ontable B)
    (on F B)
    (on E F)

    ;; clear facts (tops): H and E are initially clear
    (clear H)
    (clear E)

    ;; both hands empty initially
    (handempty)

    ;; step marker: sequence starts with done0 true (no other done predicates present)
    (done0)
  )

  ;; Goal: require the entire provided action sequence to have been executed.
  ;; The goal does not explicitly restate the final block arrangement; it requires the last step marker.
  (:goal (done30))
)