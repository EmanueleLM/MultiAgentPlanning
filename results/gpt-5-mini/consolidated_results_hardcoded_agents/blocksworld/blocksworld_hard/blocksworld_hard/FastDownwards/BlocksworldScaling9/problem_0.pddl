(define (problem blocks-problem)
  (:domain blocks-domain)
  (:objects A B C - block)

  (:init
    ;; Initial tower: A on B, B on C, C on the table
    (on A B)
    (on B C)
    (on-table C)

    ;; Clearness: top block A is clear; others are not
    (clear A)
    (not (clear B))
    (not (clear C))

    ;; Hand is empty initially
    (handempty)

    ;; No block is initially being held
    (not (holding A))
    (not (holding B))
    (not (holding C))
  )

  ;; Goal: reverse the tower so that C is on B, B is on A, and A is on the table
  (:goal (and
            (on C B)
            (on B A)
            (on-table A)
          ))
)