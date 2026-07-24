import "./App.css";

import BookDetails from "./BookDetails";
import BlogDetails from "./BlogDetails";
import CourseDetails from "./CourseDetails";

import { books, blogs, courses } from "./Data";

function App() {

    return (

        <div className="container">

            <CourseDetails courses={courses} />

            <BookDetails books={books} />

            <BlogDetails blogs={blogs} />

        </div>

    );
}

export default App;