/**
 * MIT License
 *
 * Copyright (c) 2021 Dantali0n
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

#ifndef QEMU_CSD_FUSE_LFS_MEMORY_HPP
#define QEMU_CSD_FUSE_LFS_MEMORY_HPP

#include "fuse_lfs_constants.hpp"

namespace qemucsd::fuse_lfs {

    /**
     * This header contains data structures to be stored in memory by fuse_lfs
     */

    /**
     * Directory buffer used to fill directory information before it is
     * returned to the caller. See dir_buf_add
     */
    struct dir_buf {
        char* p;
        size_t size;
    };

    // Section of path at with a certain parent.
    typedef std::pair<fuse_ino_t, std::string> path_node_t;

    // Map path sections to their corresponding inode
    typedef std::map<path_node_t, fuse_ino_t> path_inode_map_t;
}

#endif //QEMU_CSD_FUSE_LFS_MEMORY_HPP