(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)

  (:objects
    a e i - vowel
    b c d f g h j k l - consonant
  )

  (:init
    (ontable h)
    (on i h)

    (ontable k)
    (on e k)
    (on d e)
    (on b d)

    (ontable f)
    (on l f)
    (on j l)

    (ontable c)
    (on g c)
    (on a g)

    (clear i)
    (clear b)
    (clear j)
    (clear a)

    (different h k) (different h f) (different h e) (different h c) (different h g) (different h a) (different h d) (different h l) (different h i) (different h j) (different h b)
    (different k h) (different k f) (different k e) (different k c) (different k g) (different k a) (different k d) (different k l) (different k i) (different k j) (different k b)
    (different f h) (different f k) (different f e) (different f c) (different f g) (different f a) (different f d) (different f l) (different f i) (different f j) (different f b)
    (different e h) (different e k) (different e f) (different e c) (different e g) (different e a) (different e d) (different e l) (different e i) (different e j) (different e b)
    (different c h) (different c k) (different c f) (different c e) (different c g) (different c a) (different c d) (different c l) (different c i) (different c j) (different c b)
    (different g h) (different g k) (different g f) (different g e) (different g c) (different g a) (different g d) (different g l) (different g i) (different g j) (different g b)
    (different a h) (different a k) (different a f) (different a e) (different a c) (different a g) (different a d) (different a l) (different a i) (different a j) (different a b)
    (different d h) (different d k) (different d f) (different d e) (different d c) (different d g) (different d a) (different d l) (different d i) (different d j) (different d b)
    (different l h) (different l k) (different l f) (different l e) (different l c) (different l g) (different l a) (different l d) (different l i) (different l j) (different l b)
    (different i h) (different i k) (different i f) (different i e) (different i c) (different i g) (different i a) (different i d) (different i l) (different i j) (different i b)
    (different j h) (different j k) (different j f) (different j e) (different j c) (different j g) (different j a) (different j d) (different j l) (different j i) (different j b)
    (different b h) (different b k) (different b f) (different b e) (different b c) (different b g) (different b a) (different b d) (different b l) (different b i) (different b j)
  )

  (:goal (and
    (ontable l)
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
    (clear a)
  ))
)